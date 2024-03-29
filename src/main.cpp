#include "spdlog/spdlog.h"
#include <ftxui/dom/elements.hpp>
#include <ftxui/screen/screen.hpp>

int main(void) {
    using namespace ftxui;

    // Define the document
    Element document = hbox({
        text("left") | border,
        text("middle") | border | flex,
        text("right") | border,
    });

    spdlog::info("uwu");

    auto screen = Screen::Create(Dimension::Full(),       // Width
                                 Dimension::Fit(document) // Height
    );
    Render(screen, document);
    screen.Print();

    return EXIT_SUCCESS;
}